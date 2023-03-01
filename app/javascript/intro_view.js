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
  
// イラストアニメーション

  setTimeout (function(){
    document.getElementById("introduce_illust1").animate(
      [
        {opacity: 0},{opacity: 1}
      ],
      {
        duration: 1000,
        fill: 'forwards'
      }
    );
  }, 4000);


  addEventListener('scroll', function () {
    const illust1 = document.getElementById("introduce_illust2")
    const scroll = window.pageYOffset;
    if (scroll > 300){
      illust1.style.opacity = "1";
    } else {
      illust1.style.opacity = "0";
    };
  });

  addEventListener('scroll', function () {
    const illust1 = document.getElementById("introduce_illust3")
    const scroll = window.pageYOffset;
    if (scroll > 600){
      illust1.style.opacity = "1";
    } else {
      illust1.style.opacity = "0";
    };
  });
  
  
 
};

window.addEventListener("load", intro);