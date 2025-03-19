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
import com.mongodb.client.gridfs.model.GridFSFile;
import com.mongodb.client.model.Filters;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.bson.Document;
import org.bson.types.ObjectId;
import java.io.InputStream;
import org.bson.conversions.Bson;
/**
 *
 * @author bangc
 */
public class DownloadMP3File {
    public File downloadListening(String File){
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("Ielts_Test_db");
        GridFSBucket gridFSBucket = GridFSBuckets.create(database, "listening_files");
        ObjectId objectid = new ObjectId(File);
        File tempFile = new File("listening_audio.mp3");
        try (FileOutputStream streamToDownload = new FileOutputStream(tempFile)) {
            gridFSBucket.downloadToStream(objectid,streamToDownload);
            return tempFile;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            mongoClient.close();
        }
        return tempFile;
    }
    public Object downloadSpeaking(String File){
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("Ielts_Test_db");
        GridFSBucket gridFSBucket = GridFSBuckets.create(database, "speaking_files");
        ObjectId objectid = new ObjectId(File);
        File tempFile = new File("speaking_audio.mp3");
        try (FileOutputStream streamToDownload = new FileOutputStream(tempFile)) {
            gridFSBucket.downloadToStream(objectid,streamToDownload);
            return tempFile;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            mongoClient.close();
        }
        return tempFile;
    }
    public InputStream downloadListening2(String id) {
        // Kiểm tra xem id có hợp lệ không
        if (id == null || id.length() != 24 || !id.matches("[0-9a-fA-F]+")) {
            throw new IllegalArgumentException("ID không hợp lệ: " + id);
        }

        // Tạo ObjectId từ id
        ObjectId objectId = new ObjectId(id);
        Bson filter = Filters.eq("_id", objectId);
        // Kết nối đến MongoDB
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("Ielts_Test_db");
        GridFSBucket gridFSBucket = GridFSBuckets.create(database, "listening_files");
        // Tìm file MP3 trong GridFS
        GridFSFile gridFSFile = gridFSBucket.find(filter).first();
        if (gridFSFile == null) {
            mongoClient.close();
            throw new IllegalArgumentException("File MP3 không tồn tại trong MongoDB");
        }

        // Trả về InputStream của file MP3
        return gridFSBucket.openDownloadStream(objectId);
    }
}
