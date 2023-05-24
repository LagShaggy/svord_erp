<script>
	import { supabase } from '$lib/supabaseClient'
	import { session } from '$lib/stores'
	import { onDestroy, onMount } from 'svelte'
	import { goto } from '$app/navigation'
	import PowerIcon from '$icons/PowerIcon.svelte'

	let showLogout = false
	let unsubscribe = session.subscribe((value) => {
		showLogout = value.loggedIn
		console.log(
			'Logout button subscribed, show logout? ',
			showLogout
		)
	})

	async function signOut() {
		const { error } = await supabase.auth.signOut()

		if (error) {
			alert(error)
		} else {
			console.log('Logout button unsubscribing')
			session.set({
				loggedIn: false,
				data: { user: { email: '' } }
			})
			unsubscribe()
		}
	}
</script>

<button
	class="button flex justify-center"
	on:click={signOut}
>
	<PowerIcon />
</button>
