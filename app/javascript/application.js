// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', function() {
  // Dropdown Menu
  const profileButton = document.getElementById('profile-button');
  const dropdownMenu = document.getElementById('dropdown-menu');

  if (profileButton && dropdownMenu) {
    profileButton.addEventListener('click', function(event) {
      event.stopPropagation(); // Prevent event from bubbling up
      dropdownMenu.classList.toggle('hidden');
    });

    // Close dropdown if clicked outside
    window.addEventListener('click', function(event) {
      if (!event.target.matches('#profile-button') && !event.target.closest('#dropdown-menu')) {
        dropdownMenu.classList.add('hidden');
      }
    });
  }

  // Invite User Email Input Toggle
  const inviteButton = document.getElementById('invite-button');
  const emailInput = document.getElementById('email-input');

  if (inviteButton && emailInput) {
    inviteButton.addEventListener('click', function() {
      emailInput.classList.toggle('hidden'); // Toggle the 'hidden' class
    });
  }
});
