package cn.daimao.service;

import cn.daimao.mapper.SearchMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsRequestBuilder;
import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.action.admin.indices.mapping.put.PutMappingRequest;
import org.elasticsearch.action.index.IndexRequestBuilder;
import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.IndicesAdminClient;
import org.elasticsearch.client.Requests;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Product;
import pojo.Student;
import utils.MapperUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class SearchService {
    @Autowired
    private SearchMapper mapper;
    @Autowired
    private TransportClient transportClient;

    public void createIndex() {
        IndicesAdminClient client = transportClient.admin().indices();
        IndicesExistsRequestBuilder request = client.prepareExists("product2");
        IndicesExistsResponse response = request.get();
        if(!response.isExists()){
            //说明不存在
            client.prepareCreate("product").get();
            XContentBuilder mapping = null;
            try {
                mapping = XContentFactory.jsonBuilder()
                        .startObject("product")
                        .startObject("properties")
                        .startObject("productName").field("type","text").field("analyzer","ik_max_word").endObject()
                        .startObject("productDescription").field("type","text").field("analyzer","ik_max_word").endObject()
                        .endObject()
                        .endObject();
                PutMappingRequest mappingRequest = Requests.putMappingRequest("product").type("product").source(mapping);
                transportClient.admin().indices().putMapping(mappingRequest).actionGet();
            } catch (IOException e) {
                e.printStackTrace();
            }


        }
        List<Product> pList = mapper.queryAll();
        for (Product s : pList){
            try {
                String pJson = MapperUtils.MP.writeValueAsString(s);
                IndexRequestBuilder requestBuilder = transportClient.prepareIndex("product2", "product", s.getProductId());
                requestBuilder.setSource(pJson).get();
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
    }

    public List<Product> query(String query) {
        List<Product> slist =new ArrayList<>();
        QueryBuilder query1 =QueryBuilders.multiMatchQuery(query,"productName","productDescription");
        SearchRequestBuilder request = transportClient.prepareSearch("product2").setQuery(query1);
        SearchResponse response = request.get();
        SearchHits topHit = response.getHits();
        SearchHit[] hits = topHit.getHits();

        for (SearchHit hit:hits){
            try {
                String pJson=hit.getSourceAsString();
                Product product =MapperUtils.MP.readValue(pJson,Product.class);
                slist.add(product);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return slist;
    }



    public List<Student> nmsl(String query) {
        List<Student> slist =new ArrayList<>();
        QueryBuilder query1 =QueryBuilders.multiMatchQuery(query,"other","name");
//        HighlightBuilder highlightBuilder = new HighlightBuilder();
        //高亮显示规则
//        highlightBuilder.preTags("<strong>");
//        highlightBuilder.postTags("</strong>");
//        highlightBuilder.field(query);
        SearchRequestBuilder request = transportClient.prepareSearch("student3").setQuery(query1);
//                .highlighter(highlightBuilder);

        SearchResponse response = request.get();
        SearchHits topHit = response.getHits();
        SearchHit[] hits = topHit.getHits();

        for (SearchHit hit:hits){
            try {
                String pJson=hit.getSourceAsString();
                Student student =MapperUtils.MP.readValue(pJson,Student.class);
                slist.add(student);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return slist;
    }
}
