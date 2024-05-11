- [C4 Model](#c4-model)
- [編輯 C4 Model](#編輯-c4-model)
  - [使用 Structurizr/lite Docker Container (建議)](#使用-structurizrlite-docker-container-建議)
  - [使用 Structurizr 網站](#使用-structurizr-網站)

# C4 Model

本系統使用 C4 Model 來視覺化軟體架構。

詳細說明請參考[官方網站](https://c4model.com/)。

# 編輯 C4 Model

## 使用 Structurizr/lite Docker Container (建議)

Docker 指令：
```
docker container run \
--detach \
--publish 127.0.0.1:8080:8080 \
--mount type=bind,source="$(pwd)"/c4-model,target=/usr/local/structurizr \
structurizr/lite:2024.03.03
```

完成後可使用文字編輯器編輯 [workplace.dsl](./c4-model/workplace.dsl) 編輯架構，並使用網頁瀏覽器連線到 http://localhost:8080 檢視修改並匯出架構圖。

## 使用 Structurizr 網站

Structurizr 提供 Structurizr DSL 編輯與渲染功能可做簡易編輯。

網址：https://structurizr.com/dsl
