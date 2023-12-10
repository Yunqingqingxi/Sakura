document.getElementById("commentForm").addEventListener("submit", function (event) {
    event.preventDefault();

    var content = document.querySelector("#commentForm textarea").value;
    var user_id = parseInt(document.querySelector("#commentForm input[name='user_id']").value);
    var article_id = parseInt(document.querySelector("#commentForm input[name='article_id']").value);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/CommentServlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 评论提交成功，更新评论列表
            updateCommentList();
        }
    };
    xhr.send("content=" + encodeURIComponent(content) + "&user_id=" + user_id + "&article_id=" + article_id);
});

function updateCommentList() {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/CommentServlet?article_id=${article_id}", true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var comments = JSON.parse(xhr.responseText);
            var commentList = document.getElementById("commentList");
            commentList.innerHTML = "";
            for (var i = 0; i < comments.length; i++) {
                var li = document.createElement("li");
                li.textContent = comments[i].content;
                commentList.appendChild(li);
            }
        }
    };
    xhr.send();
}