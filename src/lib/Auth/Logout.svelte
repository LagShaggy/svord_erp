<script lang="ts">
	import { supabase } from '$lib/supabaseClient'
	import { session } from './authStores'

	const logout = session.logout
</script>

<button class="button flex justify-center" on:click={logout}> Logout </button>
