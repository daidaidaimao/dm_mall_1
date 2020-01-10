package cn.daimao.config;

import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.common.transport.TransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.net.InetAddress;
import java.util.List;

@Component
@Configuration
@ConfigurationProperties(prefix = "es")
public class ESConfig {
    private List<String> nodes;

    public List<String> getNodes() {
        return nodes;
    }

    public void setNodes(List<String> nodes) {
        this.nodes = nodes;
    }

    @Bean
    public TransportClient initTranSport() throws Exception{
        new PreBuiltTransportClient(Settings.EMPTY);
        TransportClient client;
        Settings settings = Settings.builder().put("cluster.name","elasticsearch").build();
        client = new PreBuiltTransportClient(settings);
        for(String node:nodes){
            String host=node.split(":")[0];
            int port = Integer.parseInt(node.split(":")[1]);

            InetAddress address = InetAddress.getByName(host);
            TransportAddress address2 =new InetSocketTransportAddress(address,port);
            client.addTransportAddress(address2);
        }

        return client;



    }

}

