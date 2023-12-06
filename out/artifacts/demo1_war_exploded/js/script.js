document.getElementById('search-form').addEventListener('submit', function(event) {
    event.preventDefault(); // 阻止表单默认提交行为

    var keyword = document.getElementById('search-input').value;
    var url = 'search?keyword=' + encodeURIComponent(keyword);

    fetch(url)
        .then(function(response) {
            return response.text();
        })
        .then(function(data) {
            document.getElementById('search-results').innerHTML = data;
        });
});