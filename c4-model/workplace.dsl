workspace {

    model {
        user = person "網頁使用者"
        
        group "臺灣 VTuber 列表" {
            vTuberListMatainer = person "VTuber 名單維護者" "維護 VTuber 名單"
            dataFetchScheduler = softwareSystem "VTuber 資料撈取" "定期從 YouTube Data API、Twitch Data API 取得 VTuber 各項資料"
            generateJsonScheduler = softwareSystem "VTuber 資料格式轉換" "定期將 VTuber 資料由 CSV 轉換為 JSON 格式"
            website = softwareSystem "臺灣 VTuber 列表網頁" "提供 VTuber 各項資料"
        }
        
        group "YouTube" {
            youTubeDataApi = softwareSystem "YouTube Data API" "提供 YouTube 頻道資料" "Existing System"
        }
        
        group "Twitch" {
            twitchApi = softwareSystem "Twitch API" "提供 Twitch 頻道資料" "Existing System"
        }
        
        group "GitHub" {
            githubApi = softwareSystem "GitHub API" "提供 GitHub commit 紀錄" "Existing System"
            vTuberDataGithubApiService = softwareSystem "VTuber 資料 (GitHub API)" "提供 VTuber 最新資料 API" "Existing System"
            csvGitRepo = softwareSystem "VTuber 資料儲存 (CSV)" "以 CSV 格式儲存 VTuber 最新資料" "Git"
            jsonGitRepo = softwareSystem "VTuber 資料儲存 (JSON)" "以 JSON 格式儲存 VTuber 最新資料" "Git"
            vTuberDebutGitRepo = softwareSystem "出道 VTuber 資料儲存 (已棄用)" "儲存出道 VTuber 資料，用於 VTuber 資料撈取功能無法取得出道資料時" "Git"
        }
        
        group "Statically" {
            vTuberDataStaticallyApiService = softwareSystem "VTuber 資料 (Statically API)" "提供 VTuber 最新資料 API" "Existing System"
        }
        
        # relationship
        user -> website "使用網頁"
        
        vTuberListMatainer -> csvGitRepo "維護 VTuber 名單"
        vTuberListMatainer -> vTuberDebutGitRepo "維護出道 VTuber 資料"
        
        dataFetchScheduler -> youTubeDataApi "取得 VTuber 頻道資料"
        dataFetchScheduler -> twitchApi "取得 VTuber 頻道資料"
        dataFetchScheduler -> csvGitRepo "儲存 VTuber 各項資料 (CSV)"
        
        generateJsonScheduler -> csvGitRepo "取得 VTuber 最新資料 (CSV)"
        generateJsonScheduler -> vTuberDebutGitRepo "取得 出道 VTuber 資料"
        generateJsonScheduler -> jsonGitRepo "產生 VTuber 最新資料 (JSON)"
        
        website -> githubApi "取得 Git commit 紀錄"
        website -> vTuberDataGithubApiService "取得 VTuber 最新資料 API"
        website -> vTuberDataStaticallyApiService "取得 VTuber 最新資料 API"
        
        githubApi -> jsonGitRepo "取得 Git commit 紀錄"
        
        vTuberDataGithubApiService -> jsonGitRepo "取得 VTuber 最新資料"
        
        vTuberDataStaticallyApiService -> jsonGitRepo "取得 VTuber 最新資料"
    }

    views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }
        
        systemContext website "SystemContext" {
            include *
            autoLayout
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Git" {
                shape Cylinder
            }
        }
    }
    
}
