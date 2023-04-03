<script>
	import { supabase } from '$lib/supabaseClient'

	async function signOut() {
		const { error } = await supabase.auth.signOut()

		if (error) {
			alert(error)
		}
	}
</script>

<button class="button" on:click={signOut}>
	SIGN OUT
</button>

	

