function appearButton() {
  const removeCheckbox = document.getElementById('remove-follow');
  let followedButton = document.querySelectorAll('.followed-button');
  if(!removeCheckbox) return null;

  function buttonStatus() {
    followedButton = document.querySelectorAll('.followed-button');
    if (removeCheckbox.checked) {
      for(let i = 0; i < followedButton.length; i++){
        let element = followedButton[i];
        element.classList.remove('hidden');
      }
    } else {
      for(let i = 0; i < followedButton.length; i++){
        let element = followedButton[i];
        element.classList.add('hidden');
      }
    }
  }

  removeCheckbox.addEventListener('change', buttonStatus);
}

window.addEventListener('load', appearButton);