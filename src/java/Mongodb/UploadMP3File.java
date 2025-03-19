/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mongodb;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.client.gridfs.model.GridFSUploadOptions;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import org.bson.Document;

/**
 *
 * @author bangc
 */
public class UploadMP3File {
    public Object uploadListening(File File){
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("Ielts_Test_db");
        GridFSBucket gridFSBucket = GridFSBuckets.create(database, "listening_files");
        GridFSUploadOptions options = new GridFSUploadOptions().metadata(new Document("description", "Listening Test Audio"));

        try (FileInputStream streamToUploadFrom = new FileInputStream(File)) {
            Object fileId = gridFSBucket.uploadFromStream("audio.mp3", streamToUploadFrom, options);
            return fileId;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            mongoClient.close();
        }
        return null;
    }
    public Object uploadSpeaking(File File){
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("Ielts_Test_db");
        GridFSBucket gridFSBucket = GridFSBuckets.create(database, "speaking_files");
        GridFSUploadOptions options = new GridFSUploadOptions().metadata(new Document("description", "Listening Test Audio"));

        try (FileInputStream streamToUploadFrom = new FileInputStream(File)) {
            Object fileId = gridFSBucket.uploadFromStream("audio.mp3", streamToUploadFrom, options);
            return fileId;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            mongoClient.close();
        }
        return null;
    }
}
