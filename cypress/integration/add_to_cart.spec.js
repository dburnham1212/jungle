describe('example to-do app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/')
  })

  it("Add a product to the cart and make sure it exists", () => {
    // Check if mycart does not have anything in it
    cy.get('.navbar').contains('My Cart').contains('0');
    // Click on add button for first item
    cy.get('.products article').first().find("button").click();
    // Check if mycart has 1 item in it
    cy.get('.navbar').contains('My Cart').contains('1');
  });
})