const intro = () => {
  
  // テキストアニメーション

 document.getElementById("introduce_text1").animate(
  [
    {opacity: 0},{opacity: 1}

  ],
  {
    duration: 1000,
    fill: 'forwards'
  }
 );

  setTimeout (function () {
    document.getElementById("introduce_text2").animate(
      [
        {opacity: 0},{opacity: 1}
      ],
      {
        duration: 1000,
        fill: 'forwards'
      }
    );
  }, 1000);

  setTimeout (function(){
    document.getElementById("introduce_text3").animate(
      [
        {opacity: 0},{opacity: 1}
      ],
      {
        duration: 1000,
        fill: 'forwards'
      }
    );
  }, 2000);

  setTimeout (function(){
    document.getElementById("introduce_text4").animate(
      [
        {opacity: 0},{opacity: 1}
      ],
      {
        duration: 2000,
        fill: 'forwards'
      }
    );
  }, 3000);
  
// ロゴアニメーション

  setTimeout (function(){
    document.getElementById("introduce_logo").animate(
      [
        {opacity: 0},{opacity: 1}
      ],
      {
        duration: 1000,
        fill: 'forwards'
      }
    );
  }, 4000); 
};

window.addEventListener("load", intro);