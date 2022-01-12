function allowIntoRoom() {
  let allowButtons = document.querySelectorAll('.room-allow-button'); 
  if(!allowButtons) return null;

  allowButtons = Array.from(allowButtons);
  allowButtons.forEach((element)=>{
    element.addEventListener('click', (e)=>{
      e.preventDefault();

      const modal = document.getElementById('modal');
      const mask = document.getElementById('mask');
      const cancel = document.getElementById('allow-room-cancel-button');
      const hidden = ()=>{
        modal.classList.add('hidden');
        mask.classList.add('hidden');
      };

      document.getElementById("allow-room-yes-button-a").href = element.href;
      document.getElementById("allowed_user_nickname").innerHTML = element.getAttribute('value');

      modal.classList.remove('hidden');
      mask.classList.remove('hidden');

      mask.addEventListener('click', () => {
        hidden();
      });

      cancel.addEventListener('click', ()=>{
        hidden();
      });
    });
  });
}

window.addEventListener('load', allowIntoRoom);