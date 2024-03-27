<script lang="ts">
	import { createEventDispatcher } from 'svelte'
	import type { AuthLoginProps } from './types'
	import SubmitButton from '$src/lib/UI/Primitive/Form/SubmitButton.svelte'

	const dispatch = createEventDispatcher<{ fire: AuthLoginProps }>()
	function fire() {
		dispatch('fire', {
			email,
			password
		})
	}

	let email: string
	let password: string

	$: submitDisabled = (): boolean => !email || !password

	// type for password toggle
	let show_password = false
</script>

<form on:submit={fire} class="items-left mx-auto mb-5 flex w-80 flex-col xl:w-1/3">
	<h1 class="mb-4"><slot /></h1>

	<div class="formrow">
		<label for="email">Email</label>
		<input
			type="email"
			id="email"
			class="input w-10"
			placeholder="example@domain.ch"
			bind:value={email}
		/>
	</div>
	<div class="formrow">
		<label for="password">Password</label>
		<input
			type="password"
			id="password"
			class="input w-10"
			placeholder="Password"
			bind:value={password}
		/>
	</div>

	<SubmitButton>Login</SubmitButton>

	{#if submitDisabled()}
		<div>Provide email and password before you submit!</div>
	{/if}
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
