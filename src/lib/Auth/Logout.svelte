<script>
	import { supabase } from '$lib/supabaseClient'
	import { session } from '$lib/stores'
	import { onDestroy, onMount } from 'svelte'
	import { goto } from '$app/navigation'

	let showLogout = false
	let unsubscribe = () => {}

	async function signOut() {
		const { error } = await supabase.auth.signOut()

		if (error) {
			alert(error)
		} else {
			unsubscribe()
			goto('/auth/login')
		}
	}

	onMount(() => {
		unsubscribe = session.subscribe((value) => {
			showLogout = value.loggedIn
		})
	})
</script>

<button class="button" on:click={signOut}>
	Sign Out: {showLogout}
</button>
