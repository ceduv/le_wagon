  # Ex 1. Read what's written in the email input
  #       Make the function getEmail() return it
  const getEmail = () => {
    # TODO: return the email
    return document.querySelector('#email').value;
  };

  # /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const borisesEmail = getEmail();

  # Ex 2. Change the content of the email input by writing your own email address
  document.querySelector('#email').value = "toto@toto.com";

  # Ex 3. Replace the email hint (next to the input) with 'This is my email now'
  #       The text should be emphasized using a <strong> tag
  document.querySelector('#email-hint').innerHTML = '<strong>This is my email now</strong>';


  # Ex 4. Add the .blue CSS class to the th elements
  document.querySelectorAll("th").forEach((title) => {
    title.classList.add("blue");
  });

  # Ex 5. Count the number of table body rows there are
  #       Make the function teamCount() return it
  const teamCount = () => {
    # TODO: return the number of teams
    return document.querySelectorAll("tbody tr").length;
  };

  # /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const teamCountBeforeAddition = teamCount();

  # Ex 6. Say there is a 15th team added to the table.
  #       Add a row at the bottom, this new team should have zero points.
  document.querySelector("tbody").insertAdjacentHTML("beforeEnd", "<td>15</td><td>TOTO</td><td>0</td>");


  # Ex 7. Write some code to sum all points given to all teams
  #       Make the function summarizePoints() return it
  const summarizePoints = () => {
    # TODO: return the sum
    return Array.from(document.querySelectorAll("tbody tr")).map(row => Number.parseInt(row.lastElementChild.innerText, 10)).reduce((acc, curr) => acc + curr);
  };


  # Ex 8. Change the background color of all `<th>` cells to #DDF4FF
  document.querySelectorAll("th").forEach((title) => {
    title.style.backgroundColor = "#DDF4FF";
  });


  # Ex 9. Remove the "Email:" label from the DOM

  document.querySelector('label').remove();
