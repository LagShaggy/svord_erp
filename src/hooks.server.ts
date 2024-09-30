import { PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY } from '$env/static/public'
import { onAuthPage } from '$lib/Auth/auth.helpers'
import { ROUTES } from '$lib/routes'
import { createServerClient } from '@supabase/ssr'
import { redirect, type Handle } from '@sveltejs/kit'
import type { Database } from './lib/supabase/database.types'
import { sequence } from '@sveltejs/kit/hooks'

export const supabase: Handle = async ({ event, resolve }) => {
	event.locals.supabase = createServerClient<Database>(
		PUBLIC_SUPABASE_URL,
		PUBLIC_SUPABASE_ANON_KEY,
		{
			cookies: {
				getAll() {
					return event.cookies.getAll()
				},
				setAll(cookiesToSet) {
					/**
					 * Note: You have to add the `path` variable to the
					 * set and remove method due to sveltekit's cookie API
					 * requiring this to be set, setting the path to an empty string
					 * will replicate previous/standard behavior (https://kit.svelte.dev/docs/types#public-types-cookies)
					 */
					cookiesToSet.forEach(({ name, value, options }) =>
						event.cookies.set(name, value, { ...options, path: '/' })
					)
				}
			}
		}
	)

	/**
	 * Unlike `supabase.auth.getSession()`, which returns the session _without_
	 * validating the JWT, this function also calls `getUser()` to validate the
	 * JWT before returning the session.
	 */
	event.locals.safeGetSession = async () => {
		const {
			data: { session }
		} = await event.locals.supabase.auth.getSession()
		if (!session) {
			return { session: null, user: null }
		}

		const {
			data: { user },
			error
		} = await event.locals.supabase.auth.getUser()
		if (error) {
			// JWT validation has failed
			return { session: null, user: null }
		}

		return { session, user }
	}

	return resolve(event, {
		filterSerializedResponseHeaders(name) {
			return name === 'content-range' || name === 'x-supabase-api-version'
		}
	})
}

const authGuard: Handle = async ({ event, resolve }) => {
	const { session, user } = await event.locals.safeGetSession()
	event.locals.session = session
	event.locals.user = user

	// Protecting routes && authentication
	if (!session && !onAuthPage(event.route.id)) {
		console.log('User not authenticated, redirecting to login')
		redirect(303, ROUTES.AUTH.LOGIN)
	}

	// if authenticated and on auth route, redirect.
	if (session && onAuthPage(event.route.id)) {
		console.log('Session found, redirecting to Svord entrypoint')
		redirect(301, ROUTES.HOME)
	}

	// if (!event.locals.session && event.url.pathname.startsWith('/private')) {
	// 	redirect(303, '/auth')
	// }

	// if (event.locals.session && event.url.pathname === '/auth') {
	// 	redirect(303, '/private')
	// }

	return resolve(event)
}

export const handle: Handle = sequence(supabase, authGuard)
