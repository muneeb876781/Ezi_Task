@include('navbar')
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <!-- Add these links in the head section of your HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <style>
        .text-uppercase {
            text-transform: uppercase !important;
            font-size: 20px;
            font-weight: bold;
        }

        .text-uppercase span {
            /* color: rgb(95, 95, 176); */
            color: #efefef;

        }

        .task-list-container {
            max-height: 350px;
            overflow-y: auto;
            width: 100%;
            display: flex;
            align-items: center;
            /* justify-content: center; */
            flex-direction: column;
        }

        .task-list-container .tasks {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-direction: row;
        }

        .task-list-container .tasks .taskname {
            display: flex;
            flex-direction: row;
            justify-content: right;
            align-items: center;
        }

        .task-list-container .tasks .taskcontent {
            display: flex;
            flex-direction: row;
            justify-content: left;
            align-items: center;
        }

        .task-list-container button {
            padding: 7px;
            background: none;
            border: 1px solid black;
            border-radius: 20px;
        }

        .task-list-container button:hover {
            border: none;
            font-size: 16px;
            color: black;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 10px 10px 20px -4px rgba(0, 0, 0, 0.3);
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            border-radius: 30px;
            width: 70%;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #confirmDeleteModal {
            z-index: 1050;
        }

        .modal-content {
            background: rgba(255, 255, 255, 0.8);
        }

        #editTaskModal {
            z-index: 1050;
            s
        }
    </style>
    <title>Service Page</title>
</head>

<body>
    <div class="main">


        <div class="servicesPage">

            <div class="pageContent">
                <div class="form">
                    <form action="{{ route('tasks.store') }}" method="post">
                        @csrf
                        <p class="username text-uppercase">Welcome, <span>{{ Auth::user()->name }}</span></p>

                        <h1>Add Your Tasks</h1>
                        <input id="title" name="title" style="padding: 20px;" type="text" required>
                        <input id="description" name="description" style="padding: 20px;" type="text" required>
                        <select name="status" id="status" required>
                            <option value="To_do">To do</option>
                            <option value="In_progress">In Progress</option>
                            <option value="Completed">Completed</option>
                        </select>
                        <input type="submit" value="Add Task">
                    </form>
                </div>
            </div>
            <div class="pageServices">
                <div class="form">
                    <h1>Tasks</h1>
                    <div class="task-list-container">
                        @foreach ($tasks as $task)
                            <div class="tasks">
                                <div class="taskname">
                                    <span id="tasktext">{{ $task->title }} </span>
                                </div>
                                <div class="taskcontent">
                                    <button style="border: none;" class=""
                                        onclick="openEditModal('{{ $task->id }}', '{{ $task->title }}', '{{ $task->description }}', '{{ $task->status }}')">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button style="border: none" class="" data-task-id="{{ $task->id }}"
                                        onclick="confirmDelete('{{ $task->id }}')">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                    <button class="" style="border: none"
                                        onclick="showDetails('{{ $task->title }}', '{{ $task->description }}', '{{ $task->status }}')">
                                        <i class="fas fa-info-circle"></i> Details
                                    </button>

                                </div>

                            </div>
                        @endforeach
                        
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal" id="taskDetailsModal">
        <div class="modal-content">
            <span class="close" onclick="hideDetails()">&times;</span>
            <h2 id="modalTitle"></h2>
            <p id="modalDescription"></p>
            <p id="modalStatus">}</p>
        </div>
    </div>

    <div class="modal" id="confirmDeleteModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Deletion</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this task?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editTaskModal" tabindex="-1" role="dialog" aria-labelledby="editTaskModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editTaskModalLabel">Edit Task</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="editTaskTitle">Title:</label>
                        <input name="title" type="text" id="editTaskTitle" class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="editTaskDescription">Description:</label>
                        <textarea name="description" id="editTaskDescription" class="form-control"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="editTaskStatus">Status:</label>
                        <select name="status" id="editTaskStatus" class="form-control">
                            <option value="To_do">To Do</option>
                            <option value="in_progress">In Progress</option>
                            <option value="completed">Completed</option>
                        </select>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="editTaskBtn">Edit</button>
                </div>
            </div>
        </div>
    </div>



    <script>
        function showDetails(title, description, status) {
            document.getElementById("modalTitle").innerHTML = "Title: " + title;
            document.getElementById("modalDescription").innerHTML = "Description: " + description;
            document.getElementById("modalStatus").innerHTML = "Status: " + status;
            document.getElementById("taskDetailsModal").style.display = "block";
        }

        function hideDetails() {
            document.getElementById("taskDetailsModal").style.display = "none";
        }
    </script>

    // Add this script in the head or at the end of your HTML body
    <script>
        var taskToDeleteId;

        function confirmDelete(taskId) {
            taskToDeleteId = taskId;
            $('#confirmDeleteModal').modal('show');
        }

        $('#confirmDeleteBtn').click(function() {
            // AJAX request to delete the task
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: '/tasks/delete/' + taskToDeleteId,
                type: 'DELETE',
                dataType: "JSON",
                data: {
                    "id": taskToDeleteId,
                },
                success: function(response) {
                    console.log(response.message);

                    $('button[data-task-id="' + taskToDeleteId + '"]').closest('.tasks').remove();

                    $('#confirmDeleteModal').modal('hide');
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                    console.log(taskToDeleteId);

                }
            });

            $('#confirmDeleteModal').modal('hide');
        });
    </script>

    <script>
        function openEditModal(taskId, title, description, status) {
            $('#editTaskTitle').val('');
            $('#editTaskDescription').val('');
            $('#editTaskStatus').val('');

            $('#editTaskTitle').val(title);
            $('#editTaskDescription').val(description);
            $('#editTaskStatus').val(status);

            $('#editTaskModal').modal('show');

            $('#editTaskBtn').data('task-id', taskId);
        }


        $('#editTaskBtn').click(function() {
            var taskId = $(this).data('task-id');
            var newTitle = $('#editTaskTitle').val();
            var newDescription = $('#editTaskDescription').val();
            var newStatus = $('#editTaskStatus').val();

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: '/tasks/update/' + taskId,
                type: 'PATCH',
                dataType: "JSON",
                data: {
                    "id": taskId,
                    title: newTitle,
                    description: newDescription,
                    status: newStatus,

                },
                success: function(response) {
                    console.log(response.message);

                    var editedTask = $('.tasks[data-task-id="' + taskId + '"]');

                    var updatedTaskData = response.updatedTaskData;
                    console.log("Received Updated Task Data:", updatedTaskData);

                    var newTitle = updatedTaskData.title; // Ensure the property name matches
                    console.log("New Title:", newTitle);

                    $('#tasktext').html(newTitle);

                    console.log("Updated Content:", $('#tasktext').html());

                    $('#editTaskModal').modal('hide');
                },

                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });
    </script>

</body>

</html>
