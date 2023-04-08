<script>
	import { createEventDispatcher } from 'svelte'

	const dispatch = createEventDispatcher()

	function fire() {
		dispatch('fire', {
			email,
			password
		})
	}

	let email = ''
	let password = ''
	let password2 = ''
	const handlePassword = (e) => {
		password = e.target.value
	}
	const handlePassword2 = (e) => {
		password2 = e.target.value
	}
	// for reusability
	export let doublepwmode = false

	// type for password toggle
	let show_password = false
	let show_password2 = false
	$: type = show_password ? 'text' : 'password'
	$: type2 = show_password2 ? 'text' : 'password'
</script>

<form
	on:submit={fire}
	class="items-left mx-auto mb-5 flex w-80 flex-col xl:w-1/3"
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
		<input type="checkbox" bind:checked={show_password} />
		<input
			id="password"
			{type}
			class="input w-10"
			placeholder="Password"
			on:input={handlePassword}
		/>
	</div>

	{#if doublepwmode}
		<div class="formrow">
			<label for="password">Type Password again: </label>
			<input
				id="password2"
				type="password"
				class="input w-10"
				placeholder="Password"
				on:input={handlePassword2}
			/>
		</div>
	{/if}

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
