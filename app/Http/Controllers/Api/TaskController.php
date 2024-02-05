<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function show()
    {
        $tasks = auth()->user()->tasks;
        return view('tasks', compact('tasks'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'description' => 'required',
            'status' => 'required|in:To_do,In_progress,Completed|max:255',
        ]);

        $task = new Task();
        $task->user_id = Auth::id();
        $task->title = $request->input('title');
        $task->description = $request->input('description');
        $task->status = $request->input('status');
        $task->save();

        return redirect()->back();
    }

    public function destroy($id)
    {
        $task = Task::find($id);
        if (!$task) {
            return response()->json(['error' => 'Task not found'], 404);
        }
        $task->delete();

        return response()->json(['message' => 'Task deleted successfully']);
    }

    public function update($id, Request $request)
    {
        $request->validate([
            'title' => 'required|string',
            'description' => 'nullable|string',
            'status' => 'required|in:To_do,in_progress,completed',
            // Add validation rules for other fields as needed
        ]);

        $task = Task::find($id);

        if (!$task) {
            return response()->json(['error' => 'Task not found'], 404);
        }

        $task->title = $request->input('title');
        $task->description = $request->input('description');
        $task->status = $request->input('status');

        $task->save();

        return response()->json(['message' => 'Task updated successfully', 'updatedTaskData' => $task]);
    }
}
