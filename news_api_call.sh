curl -sS "https://gnews.io/api/v4/search?q=President%20Trump&lang=en&country=us&apikey=$gnews_api_key" > ~/Downloads/gnews.trump.out

cat ~/Downloads/gnews.trump.out | jq '.articles[] | {
    title: .title, 
    description: .description, 
    content: .content, 
    published: .publishedAt, 
    source_name: .source.name, 
    source_url: .source.url
}'

