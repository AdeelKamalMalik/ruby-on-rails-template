// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', function() {
  const profileButton = document.getElementById('profile-button');
  const dropdownMenu = document.getElementById('dropdown-menu');

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
});
