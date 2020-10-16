// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.addEventListener('load', (event) => {

  // ハンバーガーメニュー
  const headerBtn = document.querySelector('.fa-bars');
  const headerRightTexts = document.querySelector('.l-header__top__right__texts');
  headerBtn.addEventListener('click', ()=> {
    headerRightTexts.classList.toggle('active');
    headerBtn.classList.toggle('active');
  });



  // ジャンル選択スライド
  const headerRankBtn = document.querySelector('.l-header__top__right__texts__nav__heading');
  const headerRankLists = document.querySelector('.l-header__top__right__texts__nav__lists');
  headerRankBtn.addEventListener('click', () => {
    headerRankLists.classList.toggle('active');
    if (headerRankLists.classList.contains('active')){
      headerRankBtn.style.fontWeight = "bold"
    } else {
      headerRankBtn.style.fontWeight = "normal"
    }
  });


  // ジャンル選択ボタン
  const categoryBtn = document.querySelector('.l-header__main__btn');
  const category = document.querySelector('.category__contents');

  categoryBtn.addEventListener('click', (e) => {
    e.preventDefault()
    category.classList.toggle('active');
    
    if (category.classList.contains('active')){
      categoryBtn.textContent = "閉じる";
    } else {
      categoryBtn.textContent = "ジャンルから選ぶ"
    };
  });



  // 「体型が変われば、人生が変わる」スライド
  const slide = document.querySelector('.slide');
  setTimeout(() => {
    slide.classList.add('active');
  }, 100);

  // 商品一覧(index)スライド
  const index = document.querySelector('.index');
  setTimeout(() => {
    index.classList.add('active');
  }, 1000);

  
  
});