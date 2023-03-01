window.addEventListener('load', function(){

  const navPullDown = document.getElementById("navBtn")
  const navPullDownParents = document.getElementById("navPullDown")
  
    navPullDown.addEventListener('mouseover', function(){
      this.setAttribute("style", "background-color:#e587fa;")
    })
  
    navPullDown.addEventListener('mouseout', function(){
      this.removeAttribute("style")
    })
  
    navPullDown.addEventListener('click', function() {
      // プルダウンメニューの表示と非表示の設定
      if (navPullDownParents.getAttribute("style") == "display:block;") {
        // pullDownParentsのstyle属性にdisplay:block;が指定されている場合（つまり表示されている時）実行される
        navPullDownParents.removeAttribute("style")
      } else {
        // pullDownParentsのstyle属性にdisplay:block;が指定されていない場合（つまり非表示の時）実行される
        navPullDownParents.setAttribute("style", "display:block;")
      }
    })
  })