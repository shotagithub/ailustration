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

// イラストアニメーション
  addEventListener('scroll', function () {
    const illust1 = document.getElementById("introduce_illust1")
    const scroll = window.pageYOffset;
    if (scroll > 300){
      illust1.style.opacity = "1";
    } else {
      illust1.style.opacity = "0";
    };
  });

  addEventListener('scroll', function () {
    const illust2 = document.getElementById("introduce_illust2")
    const scroll = window.pageYOffset;
    if (scroll > 600){
      illust2.style.opacity = "1";
    } else {
      illust2.style.opacity = "0";
    };
  });

  addEventListener('scroll', function () {
    const illust3 = document.getElementById("introduce_illust3")
    const scroll = window.pageYOffset;
    if (scroll > 900){
      illust3.style.opacity = "1";
    } else {
      illust3.style.opacity = "0";
    };
  });
  
  
 
};

  window.addEventListener("load", intro);