<script lang="ts">
	import Form from '$lib/UI/Primitive/Form/Form.svelte'
	import { ACTIONS } from '$lib/routes'
	import { browserSupabase } from '$src/lib/supabase/supabaseClient'
</script>

<!-- <Form action={ACTIONS.AUTH.LOGOUT}> -->
<button on:click={async () => await browserSupabase.auth.signOut()} class="text-left" type="submit">
	Logout
</button>
<!-- </Form> -->
