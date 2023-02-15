window.addEventListener('load', function(){

  const menuPullDown = document.getElementById("menuBtn")
  const menuPullDownParents = document.getElementById("menuPullDown")
  
    menuPullDown.addEventListener('mouseover', function(){
      this.setAttribute("style", "background-color:#FFBEDA;")
    })
  
    menuPullDown.addEventListener('mouseout', function(){
      this.removeAttribute("style")
    })
  
    menuPullDown.addEventListener('click', function() {
      // プルダウンメニューの表示と非表示の設定
      if (menuPullDownParents.getAttribute("style") == "display:block;") {
        // pullDownParentsのstyle属性にdisplay:block;が指定されている場合（つまり表示されている時）実行される
        menuPullDownParents.removeAttribute("style")
      } else {
        // pullDownParentsのstyle属性にdisplay:block;が指定されていない場合（つまり非表示の時）実行される
        menuPullDownParents.setAttribute("style", "display:block;")
      }
    })
  })