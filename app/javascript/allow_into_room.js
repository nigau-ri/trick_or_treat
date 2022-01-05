function allowIntoRoom() {
  const allowButton = document.getElementById('room-allow-button'); 
  if(!allowButton) return null;

  allowButton.addEventListener('click', (e)=>{
    e.preventDefault();

    const modal = document.getElementById('modal');
    const mask = document.getElementById('mask');
    const cancel = document.getElementById('allow-room-cancel-button');
    const hidden = ()=>{
      modal.classList.add('hidden');
      mask.classList.add('hidden');
    };

    modal.classList.remove('hidden');
    mask.classList.remove('hidden');

    mask.addEventListener('click', () => {
      hidden();
    });

    cancel.addEventListener('click', ()=>{
      hidden();
    });
  });
}

window.addEventListener('load', allowIntoRoom);