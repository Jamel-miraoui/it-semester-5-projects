package com.example.myapplication;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import androidx.annotation.RequiresApi;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ApiCall {

    private static final String BASE_URL = "http://10.0.2.2:8080";
    private static final ExecutorService executorService = Executors.newFixedThreadPool(5);
    private final Handler handler = new Handler(Looper.getMainLooper());

    public interface ApiResponseListener {
        void onSuccess(String response);

        void onError(String error);
    }

    public void get(String endpoint, ApiResponseListener listener) {
        executeRequest(BASE_URL + endpoint, "GET", null, listener);
    }

    public void post(String endpoint, String requestBody, ApiResponseListener listener) {
        executeRequest(BASE_URL + endpoint, "POST", requestBody, listener);
    }

    public void put(String endpoint, String requestBody, ApiResponseListener listener) {
        executeRequest(BASE_URL + endpoint, "PUT", requestBody, listener);
    }

    public void delete(String endpoint, ApiResponseListener listener) {
        executeRequest(BASE_URL + endpoint, "DELETE", null, listener);
    }

    private void executeRequest(String apiUrl, String method, String requestBody, ApiResponseListener listener) {
        executorService.execute(() -> {
            try {
                String result = makeApiRequest(apiUrl, method, requestBody);

                handler.post(() -> {
                    if (result.startsWith("Error")) {
                        listener.onError(result);
                    } else {
                        listener.onSuccess(result);
                    }
                });
            } catch (Exception e) {
                handler.post(() -> listener.onError("Error: " + e.getMessage()));
            }
        });
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    private CompletableFuture<String> makeApiRequestAsync(String apiUrl, String method, String requestBody) {
        return CompletableFuture.supplyAsync(() -> makeApiRequest(apiUrl, method, requestBody), executorService);
    }

    private String makeApiRequest(String apiUrl, String method, String requestBody) {
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod(method);

            if ("POST".equals(method) || "PUT".equals(method)) {
                urlConnection.setRequestProperty("Content-Type", "application/json");
                urlConnection.setDoOutput(true);

                try (DataOutputStream wr = new DataOutputStream(urlConnection.getOutputStream())) {
                    wr.writeBytes(requestBody);
                    wr.flush();
                }
            }

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()))) {
                StringBuilder result = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    result.append(line).append("\n");
                }
                return result.toString();
            }
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }
}