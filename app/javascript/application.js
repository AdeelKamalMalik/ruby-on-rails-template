import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', function() {
  const profileButton = document.getElementById('profile-button');
  const dropdownMenu = document.getElementById('dropdown-menu');

  if (profileButton && dropdownMenu) {
    profileButton.addEventListener('click', function(event) {
      event.stopPropagation();
      dropdownMenu.classList.toggle('hidden');
    });

    window.addEventListener('click', function(event) {
      if (!event.target.matches('#profile-button') && !event.target.closest('#dropdown-menu')) {
        dropdownMenu.classList.add('hidden');
      }
    });
  }

  const inviteButton = document.getElementById('invite-button');
  const emailInput = document.getElementById('email-input');

  if (inviteButton && emailInput) {
    inviteButton.addEventListener('click', function() {
      emailInput.classList.toggle('hidden');
    });
  }
});
