'use strict';

// SETTING THE CURRENT YEAR FOR COPY RIGHT //

const yearEl = document.querySelector('.year'); // selecting the year element

const currentYear = new Date().getFullYear(); // setting the 'currentYear' value

// Seting the current year for the copy right section
console.log(currentYear); // returns 2022

yearEl.textContent = currentYear; // setting the 'yearEl' element text content to 'currentYear'