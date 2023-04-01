<script>
	import { supabase } from '$lib/supabaseClient'

	let email = ''
	let password = ''

	async function signInWithEmail() {
		const { data, error } =
			await supabase.auth.signInWithPassword({
				email,
				password
			})
		console.log(data, error)
	}
</script>

<form
	on:submit={signInWithEmail}
	class="flex w-60 flex-col items-center justify-center"
>
	<input type="email" class="input" bind:value={email} />
	<input
		type="password"
		class="input"
		bind:value={password}
	/>

	<button
		type="submit"
		class="mt-5 w-40 rounded-md border-2 hover:bg-slate-200"
	>
		Log in
	</button>
</form>

<style>
	.input {
		@apply w-full;
		@apply rounded;
	}
</style>
