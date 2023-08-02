describe('example to-do app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/')
  })

  it("Check that we can login as an existing user", () => {
    // Click on login form
    cy.contains('Login').click();
    // fill out form fields
    cy.get('.form-group:has(label:contains("Email"))')
      .find('input')
      .type("jsmith@gmail.com")

    cy.get('.form-group:has(label:contains("Password"))')
      .find('input')
      .type("password")
    //click on submit button
    cy.contains('Submit').click();
    // check if the page contains the fact that we are signed in
    cy.contains('Signed in as John');
  });

  it("Check that we can sing up as a new user", () => {
    // Click on login form
    cy.contains('Signup').click();
    // fill out form fields
    cy.get('.form-group:has(label:contains("First name"))')
      .find('input')
      .type("Jane")

    cy.get('.form-group:has(label:contains("Last name"))')
      .find('input')
      .type("Smith")

    // get a new time stamp for the email being created
    const d = new Date();
    let localTime = d.toLocaleString();
    // create email based on timestamp
    cy.get('.form-group:has(label:contains("Email"))')
      .find('input')
      .type(`${localTime}@gmail.com`)

    cy.get('.form-group:has(label:contains("Password"))')
      .first()
      .find('input')
      .type("password")
    
    cy.get('.form-group:has(label:contains("Password confirmation"))')
      .find('input')
      .type("password")
    //click on submit button
    cy.contains('Submit').click();
    // check if the page contains the fact that we are signed in
    cy.contains('Signed in as Jane');
  });
})