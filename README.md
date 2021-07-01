# Ranked Choice Vote

## Prompt

Decide the winner of a ranked-choice election according to the votes in
`votes.csv`.

### Background

In ranked-choice elections voters specify a prioritized list of their preferred
candidates. After tallying the first-choice votes, the candidate with the fewest
votes is eliminated. The next choice on the ballots for the eliminated candidate
is then given a vote. This process is repeated either until a candidate has a
majority of the votes or only two candidates remain. The candidate with the most
votes at the end of this process wins. You can read [more about ranked-choice
voting](https://en.wikipedia.org/wiki/Instant-runoff_voting) if you are so
inclined, but this description should be sufficient to implement a solution.

### Expectations

- Your script should print out the final distribution of votes for each
  candidate and designate the winner
- Your script can be written in any programming language you'd like
- Your script should be easily runnable by the grader. You may provide
  instructions if necessary
- It is more important that you get to a working solution than a performant
  solution
- Try not to spend more than a couple hours on this
- Your response should be sent to us by email in either of the following formats:
  - a PRIVATE github repo
  - a tarball or zip of a directory

## Other stuff

Candidates need not worry about what follows for their initial submission, but
may want to review before coming in to interview.

### Extensions

- What stats would you gather and data would you store to prove the legitimacy
  of the result?
- What if results came in in an ongoing basis (streaming inputs)?
  - Batch streams, single vote streams?
- What if results needed to go out on an ongoing basis (streaming results)?
  - How to do this efficiently?
- How does this scale? What if there were 50,000,000 ballots cast?
