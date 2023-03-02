# This repo is a take-home tech test for a job application

## Task

Use Ruby on Rails to build a project conversation history. A user should be able to:

- leave a comment
- change the status of the project

The project conversation history should list comments and changes in status.

Please don’t spend any more than 3 hours on this task.

## Brief

Treat this as if this was the only information given to you by a team member, and take the approach you would normally take in order to build the right product for the company.

To this extent:

- Please write down the questions you would have asked your colleagues
- Include answers that you might expect from them
- Then build a project conversation based on the answers to the questions you raised.

## Questions I'd ask, with possible answers and my note on how it impacts my decisions

```
Q: What information does a project have?
A: We don't know yet. We know a project is created by a user, other users can comment and change its status

Note: It's safe to assume a project has a title. I'll not add any other fields untill we know what they are.
```

```
Q: What can be a project status values?
A: Draft, Open, In-progress, Closed, Archived

Note: I'll use an enum to store these values. It is probably safe to assume a project always starts as a draft.
```

```
Q: Can a project status be changed from any value to any value?
A: We don't know

Note: I'll not add any restrictions yet, other than validating the project state is one of the enum values
```

```
Q: Can all users create, see, comment and modify any project status?
A: We are still trying to figure it out.

Note: I will not add any rules nor restrictions, these can always be added later.
```

```
Q: Does the conversation history show events in a linear timescale e.g. it mixes comments and status changes in the same list?
A: It's a history view, so yes, we want to see what has happened in one timeline regardless of the event type

Note: Seems like a list that holds different data types, this has implications to how it's loaded from the database, especially if we need pagination.
```

```
Q: Do we need to paginate conversation history?
A: Not for the initial release, but we will definitelly need it soon.

Note: I'll need to make sure the data model allows loading all kinds of project events in a single query, so that it can be paginated and possibly sorted, so that pagination can be added later without redoing the data model and migrating historic data.
```

General note on the approach: work on the minimal release, where confident about future requirements, ensure they can be added without backwards-incompatibilities and there is no need to redo the data models.