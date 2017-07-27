Feature: Verify Job Board Position functionality
  In order to apply for future positions in Gorilla as an user I want to submit my personal information and resume to the recruitment department.

  Background:
    Given I am in the careers page


  Scenario: Verify header is displayed in the Job board Position
    When I navigate to the Job Board Position section
    Then Header “Don't see a position for you? Send us your resume for future consideration.” is displayed

  Scenario Outline: Submit information
    When I navigate to the Job Board Position section
    And I fill out  <First Name> <Last Name> <Email> <Country>
    And I upload a resume File
    And I click on Submit button
    Then Message “Thank you for submitting your resume. ” is displayed

    Examples:
      |	First Name	|	Last Name	|	Email		            |	Country	    |
      |     Viviana	|	Araya		|   vivianaaraya@gmail.com	| 	Costa Rica	|
      |     Mirna	|	Viquez		|   mirnaviquez@gmail.com	| 	Costa Rica	|


  Scenario Outline: Mandatory fields validation
    When I navigate to the Job Board Position section
    And I do not filling out any <mandatory fields>
    Then Alert message “Please complete this mandatory field.” is displayed
    And User is unable to click on “Submit” button

    Examples:
      | mandatory fields	|
      | First Name		    |
      | Last Name	    	|
      | Email		        |
      | Country	          	|

  Scenario Outline: Email format field validation
    When I navigate to the Job Board Position section
    And: I enter an <input> not formatted as email
    Then Alert message “Email must be formatted correctly.”
    And User is unable to click on “Submit” button

    Examples:
      | input	|
      | aabbb	|
      | aaaa11	|
      | 1111		|
      | 13423.adsflks.com |

  Scenario Outline: Verify email address is valid
    When I navigate to the Job Board Position section
    And I enter an  <invalid email>
    Then Alert message “Please enter a valid email address.”
    And User is unable to click on “Submit” button

    Examples:
      | invalid email	|
      | aaa@34335.co	|

  Scenario: Validate Upload Your Resume
    When I navigate to the Job Board Position section
    And I click on Browse of Upload Your Resume
    Then A navigation window is opened
    And I am able to select a file

  Scenario: Validate a Resume is upload
    When I navigate to the Job Board Position section
    And I click on Browse of Upload Your Resume
    And I select a file and click on “Open”
    Then File selected with the extension is displayed next to Browse option

  Scenario: Validate user can reload a resume
    When I navigate to the Job Board Position section
    And I click on Browse of Upload Your Resume
    And I select a file and click on “Open”
    Then File selected with the extension is displayed next to Browse option

  Scenario: Validate note “*Please note we do not partner with 3rd parties.” is displayed on Job Board Position
    When I navigate to the Job Board position section
    Then Message “*Please note we do not partner with 3rd parties.” is displayed on Job Board Position footer



