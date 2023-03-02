const menu = () => {

  const navPullDown = document.getElementById("navBtn")
  const navPullDownParents = document.getElementById("navPullDown")
  
    navPullDown.addEventListener('mouseover', function(){
      this.setAttribute("style", "background-color:#e587fa;")
    })
  
    navPullDown.addEventListener('mouseout', function(){
      this.removeAttribute("style")
    })
  
    navPullDown.addEventListener('click', function() {
      if (navPullDownParents.getAttribute("style") == "display:block;") {
        navPullDownParents.removeAttribute("style")
      } else {
        navPullDownParents.setAttribute("style", "display:block;")
      }
    })
}

window.addEventListener('load', menu)