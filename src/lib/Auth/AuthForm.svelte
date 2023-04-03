<script>
	import { createEventDispatcher } from 'svelte'
	const dispatch = createEventDispatcher()

	function fire() {
		dispatch('fire', {
			email,
			password
		})
	}
	export const doublepwmode = false

	let email = ''
	let password = ''
</script>

<form
	on:submit={fire}
	class="items-left mx-auto flex w-80 flex-col xl:w-1/3"
>
	<h1 class="mb-4"><slot /></h1>

	<div class="formrow">
		<label for="email">Email</label>
		<input
			id="email"
			type="email"
			class="input w-10"
			placeholder="example@domain.ch"
			bind:value={email}
		/>
	</div>
	<div class="formrow">
		<label for="password">Password</label>
		<input
			id="password"
			type="password"
			class="input w-10"
			placeholder="Password"
			bind:value={password}
		/>
	</div>

	<button type="submit" class="button mx-auto mt-2">
		Log in
	</button>
</form>

<style>
	.input {
		@apply rounded;
		@apply w-2/3;
	}
	.formrow {
		@apply flex;
		@apply justify-between;
		@apply items-center;
	}
</style>
