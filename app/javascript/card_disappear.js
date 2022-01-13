function cardDisappear () {
  let cardAppearButtons = document.querySelectorAll('.card-appear-button');
  if (!cardAppearButtons) return null;
  cardAppearButtons = Array.from(cardAppearButtons);

  const blueCardAppearButton = document.getElementById('blue-card-appear-button');
  const pinkCardAppearButton = document.getElementById('pink-card-appear-button');
  const bothCardAppearButton = document.getElementById('both-card-appear-button');
  let eventListItems = document.querySelectorAll('.event-list-item');
  let eventListItems1 = document.querySelectorAll('.event-list-item1');
  let eventListItems2 = document.querySelectorAll('.event-list-item2');
  eventListItems = Array.from(eventListItems);
  eventListItems1 = Array.from(eventListItems1);
  eventListItems2 = Array.from(eventListItems2);
  
  cardAppearButtons.forEach((element)=>{

    element.addEventListener('change', ()=>{
      if (blueCardAppearButton.checked) {
        eventListItems1.forEach((item)=>{
          item.parentElement.classList.remove('hidden');
        });
        eventListItems2.forEach((item)=>{
          item.parentElement.classList.add('hidden');
        });
      } else if (pinkCardAppearButton.checked) {
        eventListItems2.forEach((item)=>{
          item.parentElement.classList.remove('hidden');
        });
        eventListItems1.forEach((item)=>{
          item.parentElement.classList.add('hidden');
        });
      } else if (bothCardAppearButton.checked) {
        eventListItems.forEach((item)=>{
          item.parentElement.classList.remove('hidden');
        });
      }
    });
  });
}

window.addEventListener('load', cardDisappear);