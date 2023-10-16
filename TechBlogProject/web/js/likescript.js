function doLike(pid, uid){
    const data = {
        uid: uid,
        pid: pid
    };
    
    $.ajax({
        url: "LikeServlet",
        data: data,
        success: function(data, textStatus, jqXHR){
            if(data.trim() === 'liked'){
                let counterClass = ".counter_" + pid;
                let iconClass = ".like-icon_" + pid;
                let count = parseInt($(counterClass).html());
                count = count ?  count + 1 : 1;
                $(counterClass).html(count);
                $(iconClass)[0].classList.remove("fa-thumbs-o-up");
                $(iconClass)[0].classList.add("fa-thumbs-up");
                
            }else  if(data.trim() === 'deleted'){
                let counterClass = ".counter_" + pid;
                let iconClass = ".like-icon_" + pid;
                let count = parseInt($(counterClass).html());
                count = count ?  count - 1 : 0;
                $(counterClass).html(count);
                $(iconClass)[0].classList.remove("fa-thumbs-up");
                $(iconClass)[0].classList.add("fa-thumbs-o-up");
                
            }
            
        },
        error: function(jqXHR, textStatus, errorThrown){
            console.log(data);
        }
    });
}