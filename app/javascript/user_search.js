function userSearch() {
  const userSearchForm = document.getElementById('following-user-search-form');
  if(!userSearchForm) return null;

  userSearchForm.addEventListener('change', ()=>{
    userSearchForm.submit();
  });
}

window.addEventListener('load', userSearch);