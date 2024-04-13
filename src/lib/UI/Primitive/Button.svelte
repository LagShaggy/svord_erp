<script lang="ts">
	export let command = () => {}
	export let submit = false
	export let formaction: string | null = null
	export let className: string = ''
</script>

<button
	on:click={command}
	type={submit ? 'submit' : null}
	class="clickable rounded-full outline-none transition-all
	focus:border-secondary-colour focus:border-2
	{className}"
	{formaction}
>
	<slot />
</button>
