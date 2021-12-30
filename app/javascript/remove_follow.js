function appearButton() {
  const removeCheckbox = document.getElementById('remove-follow');
  const followedButton = document.getElementById('followed-button');
  if(!removeCheckbox) return null;

  function buttonStatus() {
    if (removeCheckbox.checked) {
      followedButton.removeAttribute('class');
    } else {
      followedButton.setAttribute('class', 'hidden');
    }
  }

  removeCheckbox.addEventListener('change', buttonStatus);
}

window.addEventListener('load', appearButton);