% include("header.tpl", title="Viper Web Interface")


<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Upload Sample</h3>
    </div>
    <div class="panel-body">
        <form class="form-inline" role="form" action="/add" enctype="multipart/form-data" method="post" name="submit">

            <div class="form-group">
                <input type="file" class="filestyle" data-buttonBefore="true" name="file" multiple>
            </div>

            <div class="form-group">
                <label for="compression">Compression</label>
                <select class="form-control" name="compression">
                  <option value="none">none</option>
                  <option value="zip">zip</option>
                  <option value="gz">gzip</option>
                  <option value="bz2">bzip2</option>
                  <option value="tar">tar</option>
              </select>
            </div>

            <div class="form-group">
                <label class="sr-only" for="zip_pass">Zip Pass</label>
                <input type="password" class="form-control" name="zip_pass" id="zip_pass" placeholder="Zip Password">
            </div>

            <div class="form-group">
                <label for="tag_list">Tags</label>
                <input type="text" class="form-control" name="tag_list" id="tag_list" placeholder="List of Tags">
            </div>
            
            <input type="hidden" name="project" value="{{p}}" />
            <button type="submit" class="btn btn-default">Upload</button>
        </form>
    </div>
</div>

<!-- Download from URL -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">URL Download</h3>
    </div>
    <div class="panel-body">
        <form class="form-inline" role="form" action="/URLDownload" enctype="multipart/form-data" method="post" name="submit">
            <div class="form-group">
                <label class="sr-only" for="URL">URL</label>
                <input type="search" class="form-control" name="url" id="url" placeholder="URL">
            </div>

            <div class="checkbox">
                <label><input type="checkbox" name="tor" value="tor"> Use Tor</label>
            </div>

            <div class="form-group">
                <label for="tag_list">Tags</label>
                <input type="text" class="form-control" name="tag_list" id="tag_list" placeholder="List of Tags">
            </div>

            <button type="submit" class="btn btn-default">Run</button>
        </form>
    </div>
</div>

<!-- Download from VirusTotal -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">VT Download</h3>
    </div>
    <div class="panel-body">
        <form class="form-inline" role="form" action="/virustotal" enctype="multipart/form-data" method="post" name="submit">
            <div class="form-group">
                <label class="sr-only" for="hash">HASH</label>
                <input type="search" class="form-control" name="vt_hash" id="hash" placeholder="VT HASH">
                <input type="hidden" name="project" value="{{p}}" />
            </div>
            <div class="form-group">
                <label for="tag_list">Tags</label>
                <input type="text" class="form-control" name="tag_list" id="tag_list" placeholder="List of Tags">
            </div>

            <button type="submit" class="btn btn-default">Run</button>
        </form>
    </div>
</div>


<!-- Search -->
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Search Samples</h3>
    </div>
    <div class="panel-body">
<form class="form-inline" role="form" action="/search" enctype="multipart/form-data" method="post" name="search" target="_self">
  <div class="form-group">
      <select class="form-control" name="key">
        <option value="name">Name</option>
        <option value="type">Type</option>
        <option value="mime">Mime</option>
        <option value="md5">MD5</option>
        <option value="sha256">SHA256</option>
        <option value="tag">Tag</option>
        <option value="note">Note</option>
    </select>
  </div>


  <div class="form-group">
    <label class="sr-only" for="term">Search Term</label>
    <input type="text" class="form-control" name="term" id="term" placeholder="Search Term">
  </div>


  <div class="checkbox">
    <label>
      <input type="checkbox" name="project" value="project"> All Projects
    </label>
  </div>
  <input type="hidden" name="curr_project" value="{{p}}" />
  <button type="submit" class="btn btn-default">Search</button>
</form>
</div>
</div>

<!-- List Submissions -->

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Project <strong>{{p}}</strong> contains: <strong>{{count}}</strong> Files</h3>
    </div>

        <!--<table class="table table-striped table-bordered table-hover">-->
        <div id="filter-bar"> </div>
        <table id='mytable' data-toggle="table" data-classes="table table-hover table-condensed" data-striped="true" data-show-columns="true" data-search="true" data-pagination="true" data-page-size="20">            
            <thead>
            <tr>
                <th data-field="id" data-sortable="true">#</th>
                <th data-field="name" data-sortable="true">Name</th>
                <th data-field="type" data-sortable="true">Type</th>
                <th data-field="compiled" data-sortable="true">Compiled</th>
                <th data-field="size" data-sortable="true">Size</th>
                <th data-field="md5" data-sortable="true">MD5</th>
                <th data-field="tags" data-sortable="true">Tags</th>
            </tr>
            </thead>
            <tbody>
            % for row in latest:
            <tr>
                <td>{{row.id}}</td>
                <td><a href="/file/{{p}}/{{row.sha256}}">{{row.name}}</a></td>
                <td><span class="mono">{{row.type}}</span></td>
                <td><span class="mono">{{row.compiled}}</span></td>
                <td><span class="mono">{{row.size}}</span></td>
                <td><span class="mono">{{row.md5}}</span></td>
                <td>
                % for tags in row.tag:
                {{tags.tag}},
                % end
                </td>
            </tr>
            % end   
            </tbody>
        </table>

</div>


% end
% include("footer.tpl")
