<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class UserRoleCheck
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next, string $role): Response
    {
        // Check if the user is authenticated and has the required role
        if (!auth()->check() || auth()->user()->role !== $role) {
            abort(403, 'Unauthorized action.');
        }

        return $next($request);
    }
}
