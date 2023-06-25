<script lang="ts">
	import '$src/app.css'

	import AuthGuard from '$lib/Auth/AuthGuard.svelte'
	import FootBar from '$lib/UI/FootBar/FootBar.svelte'
	import AccountDropdown from '$lib/Account/AccountDropdown.svelte'
</script>

<AuthGuard>
	<AccountDropdown />
	<div class="flex flex-col flex-grow w-full min-h-full bg-slate-100">
		<div class="h-min py-6 px-8 pb-16 font-oswald shadow-xl">
			<slot />
		</div>
		<FootBar />
	</div>
</AuthGuard>

<style>
</style>
