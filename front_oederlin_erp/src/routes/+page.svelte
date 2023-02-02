<script>
    export let data;
    let { users } = data;
    $: ({ users } = data);
</script>

<ul>
    {#each users as user}
        <li>{user.firstname + " " + user.lastname + " joined " + user.joined}</li>
    {/each}
</ul>