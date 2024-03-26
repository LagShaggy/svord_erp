import { PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY } from '$env/static/public'
import { onAuthPage } from '$lib/Auth/auth.helpers'
import { ROUTES } from '$lib/routes'
import { PrismaClient } from '@prisma/client'
import { createServerClient } from '@supabase/ssr'
import { redirect, type Handle } from '@sveltejs/kit'

export const handle: Handle = async ({ event, resolve }) => {
	const prisma = new PrismaClient()
	const supabase = createServerClient(PUBLIC_SUPABASE_URL, PUBLIC_SUPABASE_ANON_KEY, {
		cookies: {
			get: (key) => event.cookies.get(key),
			set: (key, value, options) => {
				event.cookies.set(key, value, options)
			},
			remove: (key, options) => {
				event.cookies.delete(key, options)
			}
		}
	})
	event.locals.prisma = prisma
	event.locals.supabase = supabase

	/**
	 * a little helper that is written for convenience so that instead
	 * of calling `const { data: { session } } = await supabase.auth.getSession()`
	 * you just call this `await getSession()`
	 */
	event.locals.getSession = async () => {
		const {
			data: { session }
		} = await supabase.auth.getSession()
		return session
	}

	const session = await event.locals.getSession()

	// Protecting routes && authentication
	if (!session && !onAuthPage(event.route.id)) {
		console.log('not authenticated.')
		redirect(303, ROUTES.AUTH.LOGIN);
	}
	// if authenticated and on auth route, redirect.
	if (session && onAuthPage(event.route.id)) {
		redirect(301, ROUTES.HOME);
	}

	return resolve(event, {
		filterSerializedResponseHeaders(name) {
			return name === 'content-range'
		}
	})
}
