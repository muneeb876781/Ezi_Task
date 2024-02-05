@component('mail::message')
# Task is added to your list

See details about Task:

- **Title:** {{ $task->title }}
- **Description:** {{ $task->description }}
- **Status:** {{ $task->status }}


Thanks,  
{{ $user->name }}  
© 2024 EziTask. All rights reserved.
@endcomponent
