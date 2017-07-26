Feature: Search Job

  Background:
  User searches a job
    Given I am on the Careers Page

  Scenario:  Careers Page loads
    When I am in the Home Page
    And I click on “Careers” tab
    Then all jobs should appear in the job Search form

  Scenario:  Look for a job without completing the search criteria
    When I click the “Search” button
    Then all jobs should appear


  Scenario Outline: Look for a job by Location
    When I choose a <location>
    And click “Search”
    Then all the jobs with that location should appear

    Examples:
      |location|
      |Boulder, CO|
      |Denver, CO|
      |US / Costa Rica|
      |San Jose, Costa Rica|

  Scenario: Look for a job by Job Sector
    When I choose a <jobSector>
    And click “Search”
    Then all the jobs with that location should appear

  Examples:
  |jobSector|
  |Software Engineering|
  |Project Management|
  |Mobile Development|
  |Cloud Engineering|

  Scenario: Look for a job by Keyword
    When I enter a <keyword>
    And click “Search”
    Then all the jobs with that Keyword should appear
  Examples:
  |keyword|
  |QA|
  |Developer|

  Scenario: Look for a job by invalid Keyword
    When I enter a “unexisting” keyword
    And click “Search”
    Then should show a message indicating no jobs were found

  Scenario: Look for a job by Keyword 1 and invalid Keyword 2
    When I enter a <keyword1>
    And Select “AND” in the dropdown
    And I enter “unexisting” in keyword 2
    And click “Search”
    Then should show a message indicating no jobs were found
  Examples:
  |keyword1|
  |QA|
  |Developer|

  Scenario: Look for a job by Keyword 1 OR invalid Keyword 2
    When I enter a <keyword1>
    And Select “OR” in the dropdown
    And I enter “unexisting” in keyword 2
    And click “Search”
    Then should show the jobs that matches keyword1
  Examples:
  |keyword1|
  |QA|
  |Developer|

  Scenario: Look for a job by Keyword1 AND Keyword 2
    When I enter a <keyword1>
    And Select “AND” in the dropdown
    And I enter a <keyword2>
    And click “Search”
    Then all the jobs with both Keywords should appear
  Examples:
  |keyword1  | keyword2|
  |QA		    | Quality|
  |Developer| Software|

  Scenario: Look for a job by Keyword1 OR Keyword 2
    When I enter a <keyword1>
    And Select “OR” in the dropdown
    And I enter a <keyword2>
    And click “Search”
    Then all the jobs with any of the Keywords should appear
  Examples:
  |keyword1  | keyword2|
  |QA		    | Cloud|
  |Developer| Design|

  Scenario: Look for a job by Keyword 1 AND  Keyword 2 AND invalid Keyword3
    When I enter a <keyword1>
    And Select “AND” in the dropdown
    And I enter a <keyword2>
    And I Select “AND” in the dropdown and  write “unexisting” in Keyword3
    And click “Search”
    Then should show a message indicating no jobs were found
  Examples:
  |keyword1  | keyword2|
  |QA		    | Quality|
  |Developer| Software|

  Scenario: Look for a job by Keyword 1 AND  Keyword 2 OR invalid Keyword3
    When I enter a <keyword1>
    And Select “AND” in the dropdown
    And I enter a <keyword2>
    And I Select “OR” in the dropdown and  write “unexisting” in Keyword3
    And click “Search”
    Then should show messages that contains Keyword 1 and Keyword2 and if exists keyword 3
  Examples:
  |keyword1  | keyword2|
  |QA		    | Quality|
  |Developer| Software|

  Scenario: Look for a job by Keyword 1 AND  Keyword 2 AND Keyword3
    When I enter a <keyword1>
    And Select “AND” in the dropdown
    And I enter a <keyword2>
    And I Select “AND” in the dropdown and  write “Costa” in Keyword3
    And click “Search”
    Then should show messages that contains all 3 keywords passed
  Examples:
  |keyword1  | keyword2|
  |QA		    | Quality|
  |Developer| Software|

  Scenario: Look for a job with all the criteria filled
    When I enter a <location>, <jobSector> and use a <keyword>
    And click “Search”
    Then all the jobs with that criteria should appear
  Examples:
  |location  			| jobSector			|keyword|
  |San Jose, Costa Rica	| Quality Assurance	|QA		|
  |San 				| Software Engineering	|Software|

  Scenario: Look for a job with incorrect criteria
    When I enter a <location>, <jobSector> and use a <keyword>
    And click “Search”
    Then should show a message indicating no jobs were found
  Examples:
  |location  			| jobSector			|keyword|
  |San Jose, Costa Rica	| Quality Assurance	|Developer|
  |Boulder, CO			| Quality Assurance	|QA		|







