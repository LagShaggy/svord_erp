import { derived, get, writable, type Writable } from 'svelte/store'
import type { AuthError, User, Session, UserResponse } from '@supabase/supabase-js'
import { supabase } from '$lib/supabase/supabaseClient'
import { browser } from '$app/environment'
import { CLIENT } from '$lib/routes'
import { goto } from '$app/navigation'
import { api } from '$lib/supabase/supabase.api'

export const AUTH_LOCALSTORAGE_KEY = 'SVORD_SESSION'

interface SessionStore<T> extends Writable<T> {
	logout: () => Promise<{
		error: AuthError | null
	}>
	getUserData: () => Promise<UserResponse>
}

interface SessionObject {
	user: User | null
	session: Session | null
}

const createSession = (): SessionStore<SessionObject> => {
	const store = writable<SessionObject>()
	const { subscribe, set } = store

	browser &&
		localStorage[AUTH_LOCALSTORAGE_KEY] &&
		set(JSON.parse(localStorage[AUTH_LOCALSTORAGE_KEY]))

	return {
		subscribe,
		set: (n) => {
			browser && (localStorage[AUTH_LOCALSTORAGE_KEY] = JSON.stringify(n))
			set(n)
		},
		update: (cb) => {
			const updatedStore = cb(get(store))

			browser && (localStorage[AUTH_LOCALSTORAGE_KEY] = JSON.stringify(updatedStore))
			set(updatedStore)
		},
		logout: async () => {
			const logoutResponse = await supabase.auth.signOut()
			if (logoutResponse.error) {
				alert(logoutResponse.error)
			} else {
				localStorage.removeItem(AUTH_LOCALSTORAGE_KEY)
				set({
					user: null,
					session: null
				})
			}
			goto(CLIENT.AUTH.LOGIN)
			return logoutResponse
		},
		getUserData: async () => await api.getUserData()
	}
}

export const session = createSession()

export const user = derived(session, ($session) => $session?.user)

export const loggedIn = derived(session, ($session) => $session?.user?.aud == 'authenticated')

export const pathPreviouslyOn = writable<string | null>()
