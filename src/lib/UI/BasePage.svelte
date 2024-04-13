<script lang="ts">
	export let title: string
	export let description: string = ''
	export let className: string = ''
</script>

<svelte:head>
	<title>Svord - {title}</title>
</svelte:head>

<header>
	<h1>{title}</h1>
</header>
<div class="lg:px-4 {className}">
	<p>{description}</p>
	<slot />
</div>
